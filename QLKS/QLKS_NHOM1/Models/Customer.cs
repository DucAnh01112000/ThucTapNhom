using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLKS_NHOM1.Models
{
    class Customer
    {
        public int CustomerId { set; get; }
        public string NameCustomer { set; get; }
        public DateTime DateTimeCustomer { set; get; }
        public string GenderCustomer { set; get; }
        public string AddressCustomer { set; get; }
        public string IdCardCustomer { set; get; }
        public string PhoneNumber { set; get; }


        public Customer() { }
        public Customer(DataRow dataRow)
        {
            this.CustomerId = Int32.Parse(dataRow["CustomerId"].ToString());
            this.NameCustomer = dataRow["NameCustomer"].ToString();
            this.DateTimeCustomer = DateTime.Parse(dataRow["DateTimeCustomer"].ToString());
            this.GenderCustomer = dataRow["GenderCustomer"].ToString();
            this.AddressCustomer = dataRow["AddressCustomer"].ToString();
            this.IdCardCustomer = dataRow["IdCardCustomer"].ToString();
            this.PhoneNumber = dataRow["PhoneNumber"].ToString();

        }
    }
}