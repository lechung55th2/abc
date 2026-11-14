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
| 14/11 ~13:22 | Táo Newton và 1% better (Mac) mất kết nối, 20 phút sau khi cài giam_sat | Chưa rõ (app Claude khởi động lại hoặc mất mạng). giam_sat chỉ mở app khi app đã tắt, nên không phải thủ phạm. Lỗ hổng: giam_sat canh bot nhưng không canh các phiên Claude |

## Khi bot trên Mac mất kết nối

1. Phiên cloud không tự bật lại được Mac. Kiểm tra bằng `list_environments`: không thấy máy Mac nghĩa là Remote Control đã tắt.
2. Báo chủ ngay, đừng đợi chủ hỏi. Chủ làm trên Mac: Cmd+Q app Claude rồi mở lại; còn mất thì bấm **+** cạnh "Máy tính này" để mở phiên mới và bật lại các bot.
3. Khi Mac về: chạy `bash mac/giu-may-thuc.sh` (chống ngủ, không cần sudo; gỡ bằng `bash mac/giu-may-thuc.sh go`).

## Bài học, đừng lặp lại

- **Chủ hỏi "cho quyền điều khiển máy" thì trả lời thẳng:** tài khoản chưa có tính năng chia sẻ thư mục cho cloud (11/11 chủ đã tìm, không có nút Add folder). Kiểm tra `list_computer_folders` một lần; trống thì nói không làm được. Đừng bắt chủ đi tìm lại trong Settings.
- **Phiên cloud không bấm chuột, không gõ phím, không bật app trên Mac được.** Chỉ nhắn được vào phiên Mac đang kết nối (quyền đã cấp 11/11). Mac mất kết nối thì chỉ chủ sửa được: Cmd+Q app Claude rồi mở lại.
- **Báo trạng thái thật ngay từ đầu:** nói rõ đã làm được gì, chưa làm được gì. Đừng nói "đang làm" khi tin nhắn chỉ nằm chờ.
- **Lỗi kéo dài là do không ai canh.** Việc ưu tiên số 1 khi Mac về là cài con canh có báo Telegram (xem mục dưới).

## Còn phải làm (cần làm trên Mac)

- [x] Chống ngủ: LaunchAgent com.chung.nosleep đã chạy (13/11).
- [x] Con canh `giam_sat` (Táo Newton làm 14/11): mỗi 5 phút canh bot, bocachua, app Claude; báo Telegram khi bật lại thất bại hoặc chết quá 2 lần/giờ.
- [ ] Thêm vào giam_sat: phiên Claude (Táo Newton, 1% better Mac) mất Remote Control thì tự mở lại và báo Telegram.
- [ ] Lệnh Telegram `/molai` trong bocachua: khởi động lại app Claude và các phiên từ điện thoại.
- [ ] Chrome mở lại đủ tab cũ: bật Chrome > Cài đặt > Khi khởi động > "Tiếp tục từ chỗ bạn đã dừng"; sau mỗi lần khởi động lại (máy hoặc /molai) thì `open -a "Google Chrome"` để tab cũ hiện lại. Không được đóng Chrome khi chỉ cần khởi động lại app Claude.
- [ ] Cài Chrome Remote Desktop trên Mac (chủ phải ngồi ở máy ~5 phút) để chủ tự sửa từ iPhone khi Mac mất Remote Control. Nhắc chủ lần tới chủ ở cạnh Mac.
