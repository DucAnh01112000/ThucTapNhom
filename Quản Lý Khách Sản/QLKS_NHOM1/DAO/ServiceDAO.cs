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
    class ServiceDAO
    {
        private static ServiceDAO instance;

        internal static ServiceDAO Instance
        {
            get { if (instance == null) instance = new ServiceDAO(); return instance; }
            private set { instance = value; }
        }

        public List<Service> GetAll()
        {
            List<Service> list = new List<Service>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Service_GetAll");
            foreach (DataRow item in data.Rows)
            {
                Service entry = new Service(item);
                list.Add(entry);
            }
            return list;
        }


        public bool Insert(string NameService, int Price)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Service_Insert @NameService , @Price", new object[] { NameService,Price});
            return result > 0;
        }

        public bool Update(int ServiceId, String NameService, int Price)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Service_Update @ServiceId , @NameService , @Price", new object[] { ServiceId , NameService, Price });
            return result > 0;
        }

        public bool Delete(int ServiceId)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Service_Delete @ServiceId", new object[] { ServiceId });

            return result > 0;
        }

        public List<Service> Search(string searchValue)
        {
            List<Service> list = new List<Service>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Service_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                Service entry = new Service(item);
                list.Add(entry);
            }
            return list;
        }
    }
}

