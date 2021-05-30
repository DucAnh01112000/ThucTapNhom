using DbWebsite;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using System.Data.Entity;
using System.Collections;


namespace DatabaseIO
{
   public class DBIO
    {
        MyDb mydb = new MyDb();
        public IEnumerable type_products;
        public object products;

        public IEnumerable<products> GetProducts()
        {
            return mydb.products.OrderByDescending(x => x.id).ToList();
        }
  
        public IEnumerable<new_products> GetNewProducts(int page, int pagesize)
        {
            return mydb.new_products.OrderByDescending(x => x.id).Where(c => c.new_pr == 1).ToPagedList(page, pagesize);
        }
        public IEnumerable<pro_products> GetPro_Products(int page , int pagesize )
        {
            return mydb.pro_products.OrderByDescending(x => x.id).Where(c => c.promotion_price != 0).ToPagedList(page, pagesize);
        }
        public List<type_products> GetTypeProducts()
        {
            return mydb.type_products.ToList();

        }


    }
}
