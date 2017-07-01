using System;
using System.ComponentModel.DataAnnotations;

namespace ShopAround.Models
{
    public class RegisterModel
    {
        [Display(Name = "Username")]
        [Required(ErrorMessage = "Please enter username (email)!")]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [Required(ErrorMessage = "Please enter password!")]
        public string Password { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Please enter your name!")]
        public string Name { get; set; }

        [Display(Name = "Mobile")]
        [Required(ErrorMessage = "Please enter your mobile!")]
        public string Mobile { get; set; }

        [Display(Name = "Address")]
        [Required(ErrorMessage = "Please enter your address!")]
        public string Address { get; set; }

        [Display(Name = "DOB")]
        [Required(ErrorMessage = "Please enter your date of birth!")]
        public DateTime DOB { get; set; }

        [Display(Name = "Gender")]
        [Required(ErrorMessage = "Please enter your gender!")]
        public int Gender { get; set; }

        [Display(Name = "Create at")]
        [Required(ErrorMessage = "Please enter day you register!")]
        public DateTime CreateAt { get; set; }

        [Display(Name = "Active")]
        [Required(ErrorMessage = "Please enter active!")]
        public int Active { get; set; }
    }
}