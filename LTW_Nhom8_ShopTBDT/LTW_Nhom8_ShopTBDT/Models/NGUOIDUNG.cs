//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LTW_Nhom8_ShopTBDT.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class NGUOIDUNG
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Matkhau { get; set; }
        public Nullable<int> Groupid { get; set; }
        public string HoTen { get; set; }
        public string DiaChi { get; set; }
    
        public virtual USERGROUP USERGROUP { get; set; }
    }
}