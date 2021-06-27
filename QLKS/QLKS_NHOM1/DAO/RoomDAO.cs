using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLKS_NHOM1.Models;
using QLKS_NHOM1.DataAccessLayer;
using System.Data;
namespace QLKS_NHOM1.DAO
{
    class RoomDAO
    {
        private static RoomDAO instance;

        internal static RoomDAO Instance
        {
            get { if (instance == null) instance = new RoomDAO(); return instance; }
            private set { instance = value; }
        }

        public List<Room> GetAll()
        {
            List<Room> list = new List<Room>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Room_GetAll");
            foreach (DataRow item in data.Rows)
            {
                Room entry = new Room(item);
                list.Add(entry);
            }
            return list;
        }


        public bool Insert(String NameRoom, int Status,int RoomTypeId)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Room_Insert @NameRoom , @Status , @RoomTypeId", new object[] { NameRoom,Status,RoomTypeId });
            return result > 0;
        }

        public bool Update(int RoomId, String NameRoom, int Status,int RoomTypeId)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Room_Update @RoomId , @NameRoom , @Status , @RoomTypeId ", new object[] { RoomId,NameRoom,Status,RoomTypeId});
            return result > 0;
        }

        public bool Delete(int RoomId)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Room_Delete @RoomId", new object[] { RoomId });

            return result > 0;
        }

        public List<Room> Search(string searchValue)
        {
            List<Room> list = new List<Room>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Room_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                Room entry = new Room(item);
                list.Add(entry);
            }
            return list;
        }
    }
}

