duties = ["代表", "副代表", "会計係", "ユニフォーム係", "ボール係", "合宿係", "試合係", "入退部係", "イベント係"]
names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary)

0.upto(8) do |idx|
  memberData = Member.find_by(name: names[idx])
  Duty.create(
    member: memberData,
    duty: duties[idx]
  )
end
