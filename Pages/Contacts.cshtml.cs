using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace AddressBook.Pages
{
    public class ContactsModel : PageModel
    {
        private readonly AddressBookDbContext _context = new AddressBookDbContext();

        public List<Contact> Contacts { get; set; } = new List<Contact>();

        public string Username { get; set; } = "";

        
        public async Task OnGetAsync( int? userId)
        {
            if (userId.HasValue)
            {
                var user = await _context.Users.FindAsync(userId.Value);
                Username = user?.Username ?? "";

                Contacts = await _context.Contacts
                    .Where(c => c.UserId == userId.Value)
                    .AsNoTracking()
                    .ToListAsync();
            }
            else
            {
                Contacts = await _context.Contacts
                    .AsNoTracking()
                    .ToListAsync();
            }
           
            
        }
    }
}
