class DutiesController < ApplicationController
  def index
    @duties = Duty.order("id")
    @members = Member.order("number")
    <% @page_title = "当番名簿" %>
    <h1><%= @page_title %></h1>
    <% if @duties.present? %>
      <table class="list">
        <thead>
          <tr>
            <th>当番</th>
            <th>氏名</th>
          </tr>
        </thead>
        <tbody>
          <% @duties.each do |duty| %>
            <% @member = @members.find_by(id: duty.member_id) %>
            <tr>
              <td style="text-align: right"><%= duty.duty %></td>
              <td><%= @member.full_name %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    <% else %>
      <p>会員情報がありません。</p>
    <% end %>
  end
end