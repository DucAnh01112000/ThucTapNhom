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
    class AccountDAO
    {
        private static AccountDAO instance;

        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set { instance = value; }
        }

        private AccountDAO() { }

        public bool Login(string Email, string Password)
        {
            string query = "QLKS_Login @UserName , @PassWord";

            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] { Email, Password });

            return result.Rows.Count > 0;
        }

        public bool Insert(string UserName, string PassWord)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Account_Insert @UserName , @PassWord", new object[] { UserName, PassWord });
            return result > 0;
        }
    }
}
