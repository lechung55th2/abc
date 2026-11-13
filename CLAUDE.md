# Ghi chú vận hành

Repo của phiên "1% better" (cloud). Chủ nhắn việc qua bot Telegram bocachua. Các bot chạy trên Mac mini qua Remote Control:
- **Táo Newton**: chỉ lo bán hàng (Marketplace, khách).
- **Tổng quản bocachua**: bot Telegram, thẻ việc.
- **1% better (trên Mac)**: plugin, skill, việc lặt vặt trên máy.

## Sự cố đã gặp, đừng để lặp lại

| Ngày | Chuyện gì | Nguyên nhân |
|---|---|---|
| 11/11 ~11:40 | App Claude đóng hết tab Terminal, mọi bot tắt | App khởi động lại |
| 13/11 ~03:06 | Mọi phiên trên Mac mất kết nối, Tổng quản bị lưu trữ, cả sáng không ai biết | Remote Control trên Mac tắt; không có gì canh và báo |

## Khi bot trên Mac mất kết nối

1. Phiên cloud không tự bật lại được Mac. Kiểm tra bằng `list_environments`: không thấy máy Mac nghĩa là Remote Control đã tắt.
2. Báo chủ ngay, đừng đợi chủ hỏi. Chủ làm trên Mac: Cmd+Q app Claude rồi mở lại; còn mất thì bấm **+** cạnh "Máy tính này" để mở phiên mới và bật lại các bot.
3. Khi Mac về: chạy `bash mac/giu-may-thuc.sh` (chống ngủ, không cần sudo; gỡ bằng `bash mac/giu-may-thuc.sh go`).

## Còn phải làm (cần làm trên Mac)

- [ ] Chạy `mac/giu-may-thuc.sh`.
- [ ] Con canh: kiểm tra các bot mỗi 5 phút, chết thì tự bật lại **và nhắn Telegram báo chủ**. Phải viết trên Mac, vì chỉ ở đó mới biết lệnh bật từng bot.
