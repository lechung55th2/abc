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

## Bài học, đừng lặp lại

- **Chủ hỏi "cho quyền điều khiển máy" thì trả lời thẳng:** tài khoản chưa có tính năng chia sẻ thư mục cho cloud (11/11 chủ đã tìm, không có nút Add folder). Kiểm tra `list_computer_folders` một lần; trống thì nói không làm được. Đừng bắt chủ đi tìm lại trong Settings.
- **Phiên cloud không bấm chuột, không gõ phím, không bật app trên Mac được.** Chỉ nhắn được vào phiên Mac đang kết nối (quyền đã cấp 11/11). Mac mất kết nối thì chỉ chủ sửa được: Cmd+Q app Claude rồi mở lại.
- **Báo trạng thái thật ngay từ đầu:** nói rõ đã làm được gì, chưa làm được gì. Đừng nói "đang làm" khi tin nhắn chỉ nằm chờ.
- **Lỗi kéo dài là do không ai canh.** Việc ưu tiên số 1 khi Mac về là cài con canh có báo Telegram (xem mục dưới).

## Còn phải làm (cần làm trên Mac)

- [ ] Chạy `mac/giu-may-thuc.sh`.
- [ ] Con canh: kiểm tra các bot mỗi 5 phút, chết thì tự bật lại **và nhắn Telegram báo chủ**. Phải viết trên Mac, vì chỉ ở đó mới biết lệnh bật từng bot.

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:
- When graphify-out/graph.json exists, run `graphify query "<question>"` before your first grep, search or source-file read for a codebase question, and put this rule in every subagent prompt that explores code. Read raw files only for lines the graph or an earlier read already located. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
- A committed graphify-out/graph.json is rewritten whole on every build, so a large diff to it in a pull request is expected. Do not flag it as churn or suggest skipping the graph rebuild or its hooks.
