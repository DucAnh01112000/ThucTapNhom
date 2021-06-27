using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLKS_NHOM1.Models
{
    class Room
    {
        public int RoomId { set; get; }
        public string NameRoom { set; get; }

        public int Status { set; get; }

        public int RoomTypeId { set; get; }

        public Room() { }
        public Room(DataRow dataRow)
        {
            this.RoomId = Int32.Parse(dataRow["RoomId"].ToString());
            this.NameRoom = dataRow["NameRoom"].ToString();
            this.Status = Int32.Parse(dataRow["Status"].ToString());
            this.RoomTypeId = Int32.Parse(dataRow["RoomTypeId"].ToString());
        }
    }
}