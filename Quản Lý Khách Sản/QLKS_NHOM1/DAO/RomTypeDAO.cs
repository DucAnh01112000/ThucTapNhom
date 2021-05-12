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
    class RomTypeDAO
    {
        private static RomTypeDAO instance;

        internal static RomTypeDAO Instance
        {
            get { if (instance == null) instance = new RomTypeDAO(); return instance; }
            private set { instance = value; }
        }

        public List<RoomType> GetAll()
        {
            List<RoomType> list = new List<RoomType>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_RoomType_GetAll");
            foreach (DataRow item in data.Rows)
            {
                RoomType entry = new RoomType(item);
                list.Add(entry);
            }
            return list;
        }

       
        public bool Insert(String NameType,int Price)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_RoomType_Insert @NameType , @Price", new object[] { NameType,Price});
            return result > 0;
        }

        public bool Update(int RoomTypeId,String NameType,int Price)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_RoomType_Update @RoomTypeId , @NameType , @Price ", new object[] {RoomTypeId,NameType,Price});
            return result > 0;
        }

        public bool Delete(int RoomTypeId)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_RoomType_Delete @RoomTypeId", new object[] { RoomTypeId });

            return result > 0;
        }

        public List<RoomType> Search(string searchValue)
        {
            List<RoomType> list = new List<RoomType>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_RoomType_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                RoomType entry = new RoomType(item);
                list.Add(entry);
            }
            return list;
        }
    }
}

