require 'test_helper'

class AsagaoTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true # 必ず成功するアサーション
  end

  test "can see the top page" do
    get "/"
    assert_response :success
    assert_select "img[src*=logo]"
  end

  test "cannot see the member's page without login" do
    get "/members"
    assert_response :forbidden
  end

  test "can see the member's page with login" do
    post "/session", params: { name: "Jiro", password: "asagao!" }
    get "/members"
    assert_response :success
  end

  test "cannot post with empty title" do
    post "/session", params: { name: "Taro", password: "asagao!" }
    post "/entries", params: { entry: { title: "", body: "Rails is awesome!", status: "draft" } }
    assert_response :success
    assert_select "li", "タイトルを入力してください"
  end

  test "can signup" do # このテストは高確率で成功するが、テストとしては相応しくない
    assert_difference "Member.count", +1 do
      post "/account", params: {
        member: {
          number: Member.all.map(&:number).max + 1, # 100に達するまでは成功する
          name: (1..4).map { rand(65..90).chr }.join, # ランダムな名前、高確率で成功する
          full_name: "John Doe",
          email: "john_doe@asagao.com",
          birthday: "2000-11-25",
          sex: 1,
          administrator: false,
          password: "asagao!",
          password_confirmation: "asagao!"
        }
      }
    end
    assert_response :redirect
  end

  test "can see the admin/member's page with login" do
    post "/session", params: { name: "Taro", password: "asagao!" }
    get "/admin/members"
    assert_response :success
  end

  test "cannot post with empty body" do
    post "/session", params: { name: "Taro", password: "asagao!" }
    post "/entries", params: { entry: { title: "Rails Test", body: "", status: "draft" } }
    assert_response :success
    assert_select "li", "本文を入力してください"
  end
end
