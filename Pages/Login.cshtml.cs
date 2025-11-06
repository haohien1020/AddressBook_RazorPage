using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AddressBook.Pages
{
    public class LoginModel : PageModel
    {
        private readonly AddressBookDbContext _context = new AddressBookDbContext();

        public List<User> Users { get; set; } = new List<User>();

        [BindProperty]
        public string Username { get; set; }

        [BindProperty]
        public string Password { get; set; }

        public string ErrorMessage { get; set; }

        public void OnGet()
        {
            //// Nếu đã đăng nhập thì quay lại Contacts
            //if (HttpContext.Session.GetString("Username") != null)
            //{
            //    Response.Redirect("/Contacts");
            //}
        }

        public IActionResult OnPost()
        {
            // Kiểm tra người dùng hợp lệ
            var user = _context.Users
                .FirstOrDefault(u => u.Username == Username && u.Password == Password && u.IsActive == true);

            if (user == null)
            {
                ErrorMessage = "Sai tài khoản hoặc mật khẩu!";
                return Page();
            }

            //// ✅ Lưu Session
            //HttpContext.Session.SetString("Username", user.Username);
            //HttpContext.Session.SetString("Role", user.Role);
            //HttpContext.Session.SetInt32("UserId", user.Id);

            // ✅ Điều hướng theo Role
            if (user.Role == "Admin")
                return RedirectToPage("/Contacts/AdminView");
            else
                return RedirectToPage("/Contacts", new { userId = user.Id });

        }
    }
}
