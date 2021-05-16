using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Quan_Li_Nha_Hang.Models
{
    class NhanVienMod
    {
        //khai bao bien va ham thuoc tinh
        protected string MaNV { get; set; }
        protected string TenNV { get; set; }
        protected DateTime NgaySinhNV { get; set; }
        protected string DiaChiNV { get; set; }
        protected string GioiTinhNV { get; set; }
        protected string SDTNV { get; set; }
        protected string LuongNV { get; set; }
        protected string MaBPNV { get; set; }

        public NhanVienMod(string _MaNV)
        {
            MaNV = _MaNV;
        }
        public NhanVienMod() { }
        public NhanVienMod(string _MaNV,string _TenNV,DateTime _NgaySinhNV,string _DiaChiNV,string _GioiTinhNV,string _SDTNV,string _LuongNV,string _MaBPNV)
        {
            MaNV = _MaNV;
            TenNV = _TenNV;
            NgaySinhNV = _NgaySinhNV;
            DiaChiNV = _DiaChiNV;
            GioiTinhNV = _GioiTinhNV;
            SDTNV = _SDTNV;
            LuongNV = _LuongNV;
            MaBPNV = _MaBPNV;
        }

        //Khai bao cac ham them-sua-xoa Nhan Vien
        public int InsertNhanVien()
        {
            int i = 0;
            string[] paras = new string[8] { "@MaNV", "@TenNV", "@NgaySinh", "@DiaChi", "@GT", "@SDT", "@Luong", "@MaBP" };
            object[] values = new object[8] { MaNV, TenNV, NgaySinhNV, DiaChiNV, GioiTinhNV, SDTNV, LuongNV, MaBPNV };
            i = Models.Connection.Excute_Sql("spInsertNhanVien", CommandType.StoredProcedure, paras, values);
            return i;
        }

        public int UpdateNhanVien()
        {
            int i = 0;
            string[] paras = new string[8] { "@MaNV", "@TenNV", "@NgaySinh", "@DiaChi", "@GT", "@SDT", "@Luong", "@MaBP" };
            object[] values = new object[8] { MaNV, TenNV, NgaySinhNV, DiaChiNV, GioiTinhNV, SDTNV, LuongNV, MaBPNV };
            i = Models.Connection.Excute_Sql("spUpdateNhanVien", CommandType.StoredProcedure, paras, values);
            return i;
        }
        public int DeleteNhanVien()
        {
            int i = 0;
            string[] paras = new string[1] { "@MaNV" };
            object[] values = new object[1] { MaNV};
            i = Models.Connection.Excute_Sql("spUpdateNhanVien", CommandType.StoredProcedure, paras, values);
            return i;
        }
        //khoi tao ham dataset de load NhanVien
        public static DataSet FillDataSetNhanVien()
        {
            //goi thu tuc GetNhanVien
            return Models.Connection.FillDataSet("spgetNhanVien", CommandType.StoredProcedure);
        }
        public DataSet FillDataSet_GetNhanVienByMa()
        {
            DataSet ds = new DataSet();
            string[] paras = new string[1] { "@MaNV" };
            object[] values = new object[1] { MaNV};
            ds = Models.Connection.FillDataSet("spgetNhanVienbyID", CommandType.StoredProcedure, paras, values);
            return ds;
        }
    }
}
