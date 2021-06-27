using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLKS_NHOM1.Models
{
    class Bill
    {
        public int BillId { set; get; }
        public int CustomerId { set; get; }
        public DateTime DateCheckIn { set; get; }

        public DateTime DateCheckOut { set; get; }
        public int RoomId { set; get; }

        public int Status { set; get; }


        public Bill() { }
        public Bill(DataRow dataRow)
        {
            this.BillId = Int32.Parse(dataRow["BillId"].ToString());
            this.CustomerId = Int32.Parse(dataRow["CustomerId"].ToString());
            this.DateCheckIn = DateTime.Parse(dataRow["DateCheckIn"].ToString());
            this.DateCheckOut = DateTime.Parse(dataRow["DateCheckOut"].ToString());
            this.RoomId = int.Parse(dataRow["RoomId"].ToString());
            this.Status = Int32.Parse(dataRow["Status"].ToString());



        }
    }
}