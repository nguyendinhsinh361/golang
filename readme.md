Note:

Err 1:How to fix "go get: warning: modules disabled by GO111MODULE=auto in GOPATH/src"

- go env -w GO111MODULE=on
  go mod init module_name

- Muốn sử dụng module khác thì phải run:
  go mod edit -replace example.com/greetings=../greetings
  go mod tidy
  ==========================================================

- fmt: Gói này cho phép định dạng các chuỗi, giá trị cơ bản hoặc bất kì thứ gì và in chúng hoặc thu nhập đầu vào của người dùng từ bảng điều khiểm hoặc ghi vào tệp bằng trình ghi hoặc thậm chí in các thông báo lỗi ưa thích tùy chỉnh. Gói này là tất cả về định dạng đầu vào và đầu ra.

- math/rand: Sử dụng để tính toán

1. func swap(x,y string) (string, string) {
   return y, x;
   // Trả về 2 giá trị kiểu string
   }

2. Giá trị mặc định mà chúng ta không gán giá trị thì mặc định nó sẽ là 0 hoặc, false, hoặc "";
3. Có hỗ trợ ép kiểu
   4: := Khai báo nhanh không cần gán kiểu;
4. Kiểu dữ liệu được gán ở sau biến;
5. Ngoặc đơn không được xuống dòng;
6. Có thể vừa khai báo biến vừa đặt câu lệnh if luôn

- VD: if v: math.Pow(x, n); v < lim {
  return v
  }

8. switch mà không có condition thì giống như là if bình thường
9. defer: Thực thi ngay trước khi hàm chứa nó chạy xong(trước khi kết thúc, nghĩa là nó sẽ chạy cuối cùng)
10. Khái niệm stuckingb
    11: Các dataTypes trong Go: int, string, float32, int, ...
11. Nếu không trả về gì(chỉ có return) thì Go tự động hiểu và trả về giá trị falsy value(Ví dụ: false, 0, "", undefined, NaN) nếu không có biến khởi tạo ban đầu. Còn khi có biến khởi tạo thì nó sẽ trả về giá trị đó
12. %T sẽ trả về type của giá trị đó nếu nó không khai báo kiểu lúc tạo biến
13. const trong Go vẫn giống với trong js
14. while trong Go dùng thay bằng for luôn
15. if không cần cặp dấu ngoặc đơn
