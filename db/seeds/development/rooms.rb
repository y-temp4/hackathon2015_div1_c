# coding: utf-8

messages = %w(hoge fuga piyo bar foo)
address = %w(東京都 埼玉 神奈川 千葉 山梨)

0.upto(30) do |n|
  Room.create(
                 user_id: rand(10) + 1,
                 title: "Room No #{n}",
                 message: messages[n%5],
                 address: address[n%5],
                 amount: n+2,
                 price: 100*n
                )
end
