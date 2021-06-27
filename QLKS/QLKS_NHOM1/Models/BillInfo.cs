using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLKS_NHOM1.Models
{
    class BillInfo
    {
        public int BillInfoId { set; get; }
        public int BillId { set; get; }
        public int ServiceId { set; get; }

        public int IntCount { set; get; }

        public DateTime DateService { set; get; }


        public BillInfo() { }
        public BillInfo(DataRow dataRow)
        {
            this.BillInfoId = Int32.Parse(dataRow["BillInfoId"].ToString());
            this.BillId = Int32.Parse(dataRow["BillId"].ToString());
            this.ServiceId = Int32.Parse(dataRow["ServiceId"].ToString());
            this.IntCount = Int32.Parse(dataRow["IntCount"].ToString());
            this.DateService = DateTime.Parse(dataRow["DateService"].ToString());

        }
    }
}