using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace AddressBook.Pages
{
    public class ContactsModel : PageModel
    {
        private readonly AddressBookDbContext _context = new AddressBookDbContext();

        public List<Contact> Contacts { get; set; }  = new List<Contact>(); 
        public async Task OnGetAsync()
        {
            Contacts = await _context.Contacts.AsNoTracking().ToListAsync();
        }
    }
}
