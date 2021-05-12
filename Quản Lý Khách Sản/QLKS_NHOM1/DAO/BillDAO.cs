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
    class BillDAO
    {
        private static BillDAO instance;

        internal static BillDAO Instance
        {
            get { if (instance == null) instance = new BillDAO(); return instance; }
            private set { instance = value; }
        }

        public List<Bill> GetAll()
        {
            List<Bill> list = new List<Bill>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Bill_GetAll");
            foreach (DataRow item in data.Rows)
            {
                Bill entry = new Bill(item);
                list.Add(entry);
            }
            return list;
        }


        public bool Insert(int CustomerId, DateTime DateCheckIn, DateTime DateCheckOut, int RoomId, int Status)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Bill_Insert @CustomerId , @DateCheckIn , @DateCheckOut , @RoomId , @Status ", new object[] { CustomerId, DateCheckIn,DateCheckOut,RoomId,Status});
            return result > 0;
        }

        public bool Update(int BillId,int CustomerId, DateTime DateCheckIn, DateTime DateCheckOut, int RoomId, int Status)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Bill_Update @BillId , @CustomerId , @DateCheckIn , @DateCheckOut , @RoomId , @Status", new object[] { BillId, CustomerId, DateCheckIn, DateCheckOut, RoomId, Status });
            return result > 0;
        }

        public bool Delete(int BillId)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Bill_Delete @BillId", new object[] { BillId });

            return result > 0;
        }

        public List<Bill> Search(string searchValue)
        {
            List<Bill> list = new List<Bill>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Bill_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                Bill entry = new Bill(item);
                list.Add(entry);
            }
            return list;
        }
    }
}

