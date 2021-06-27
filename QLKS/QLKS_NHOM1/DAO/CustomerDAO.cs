using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLKS_NHOM1.DataAccessLayer;
using QLKS_NHOM1.Models;

namespace QLKS_NHOM1.DAO
{
    class CustomerDAO
    {
        private static CustomerDAO instance;

        internal static CustomerDAO Instance
        {
            get { if (instance == null) instance = new CustomerDAO(); return instance; }
            private set { instance = value; }
        }
        public List<Customer> GetAll()
        {
            List<Customer> list = new List<Customer>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Customer_GetAll");

            foreach (DataRow item in data.Rows)
            {
                Customer entry = new Customer(item);
                list.Add(entry);
            }
            return list;
        }

        public bool CheckInsert(string NameCustomer, DateTime DateTimeCustomer, string GenderCustomer, string AddressCustomer, string idCardCustomer, string PhoneNumber)
        {
            List<Customer> list = new List<Customer>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Customer_Insert @NameCustomer , @DateTimeCustomer , @GenderCustomer , @AddressCustomer , @idCardCustomer , @honeNumber", new object[] { NameCustomer, DateTimeCustomer, GenderCustomer, AddressCustomer, idCardCustomer, PhoneNumber });
            foreach (DataRow item in data.Rows)
            {
                Customer entry = new Customer(item);
                list.Add(entry);
            }
            return list.Count == 0;
        }

        public bool Insert(string NameCustomer, DateTime DateTimeCustomer, string GenderCustomer, string AddressCustomer, string idCardCustomer, string PhoneNumber)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Customer_Insert @NameCustomer , @DateTimeCustomer , @GenderCustomer , @AddressCustomer , @idCardCustomer , @honeNumber", new object[] { NameCustomer, DateTimeCustomer, GenderCustomer, AddressCustomer, idCardCustomer, PhoneNumber });
            return result > 0;
        }

        public bool Update(int CustomerId, string NameCustomer, DateTime DateTimeCustomer, string GenderCustomer, string AddressCustomer, string idCardCustomer, string PhoneNumber)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Customer_Update @CustomerId , @NameCustomer , @DateTimeCustomer , @GenderCustomer , @AddressCustomer , @idCardCustomer , @honeNumber", new object[] { CustomerId, NameCustomer, DateTimeCustomer, GenderCustomer, AddressCustomer, idCardCustomer, PhoneNumber });
            return result > 0;
        }

        public bool Delete(int CustomerId)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Customer_Delete @CustomerId", new object[] { CustomerId });

            return result > 0;
        }
        public List<Customer> Search(string searchValue)
        {
            List<Customer> list = new List<Customer>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_Customer_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                Customer entry = new Customer(item);
                list.Add(entry);
            }
            return list;
        }
    }
}
