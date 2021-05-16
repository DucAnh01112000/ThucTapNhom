using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Quan_Li_Nha_Hang.Controllers
{
    class NhanVienCtrl
    {
        public static DataSet FillDataSet_GetNhanVienByMa(string _MaNV)
        {
            try
            {
                Models.NhanVienMod nvien = new Models.NhanVienMod(_MaNV);
                return nvien.FillDataSet_GetNhanVienByMa();
            }
            catch
            {
                return null;
            }

        }
        //Method ADD
        public static int InsertNhanVien(string _MaNV, string _TenNV, DateTime _NgaySinhNV, string _DiaChiNV, string _GioiTinhNV, string _SDTNV, string _LuongNV, string _MaBPNV)
        {
            try
            {
                Models.NhanVienMod _nhanvien = new Models.NhanVienMod(_MaNV, _TenNV, _NgaySinhNV, _DiaChiNV, _GioiTinhNV, _SDTNV, _LuongNV, _MaBPNV);
                return _nhanvien.InsertNhanVien();
            }
            catch
            {
                return 0;
            }
        }
        //method Update
        public static int UpdateNhanVien(string _MaNV, string _TenNV, DateTime _NgaySinhNV, string _DiaChiNV, string _GioiTinhNV, string _SDTNV, string _LuongNV, string _MaBPNV)
        {
            try
            {
                Models.NhanVienMod _nhanvien = new Models.NhanVienMod(_MaNV, _TenNV, _NgaySinhNV, _DiaChiNV, _GioiTinhNV, _SDTNV, _LuongNV, _MaBPNV);
                return _nhanvien.UpdateNhanVien();
            }
            catch
            {
                return 0;
            }
        }
        //Method Delete
        public static int DeleteNhanVien(string _MaNV)
        {
            try
            {
                Models.NhanVienMod _nhanvien = new Models.NhanVienMod(_MaNV);
                return _nhanvien.DeleteNhanVien();
            }
            catch
            {
                return 0;
            }
        }
    }
}
