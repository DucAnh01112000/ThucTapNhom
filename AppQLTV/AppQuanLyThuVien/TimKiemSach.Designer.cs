
namespace AppQuanLyThuVien
{
    partial class TimKiemSach
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_Thoat = new System.Windows.Forms.Button();
            this.btn_Tim = new System.Windows.Forms.Button();
            this.txb_TimKiemSach = new System.Windows.Forms.TextBox();
            this.rbtn_TimKiemTenSach = new System.Windows.Forms.RadioButton();
            this.rbtn_TimKiemMaSach = new System.Windows.Forms.RadioButton();
            this.dgv_Sach = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Sach)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.btn_Thoat);
            this.panel1.Controls.Add(this.btn_Tim);
            this.panel1.Controls.Add(this.txb_TimKiemSach);
            this.panel1.Controls.Add(this.rbtn_TimKiemTenSach);
            this.panel1.Controls.Add(this.rbtn_TimKiemMaSach);
            this.panel1.Location = new System.Drawing.Point(79, 70);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(683, 127);
            this.panel1.TabIndex = 0;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(123, 17);
            this.label2.TabIndex = 5;
            this.label2.Text = "Thông tin tìm kiếm";
            // 
            // btn_Thoat
            // 
            this.btn_Thoat.Location = new System.Drawing.Point(550, 78);
            this.btn_Thoat.Name = "btn_Thoat";
            this.btn_Thoat.Size = new System.Drawing.Size(80, 24);
            this.btn_Thoat.TabIndex = 4;
            this.btn_Thoat.Text = "Thoát";
            this.btn_Thoat.UseVisualStyleBackColor = true;
            this.btn_Thoat.Click += new System.EventHandler(this.btn_Thoat_Click);
            // 
            // btn_Tim
            // 
            this.btn_Tim.Location = new System.Drawing.Point(550, 41);
            this.btn_Tim.Name = "btn_Tim";
            this.btn_Tim.Size = new System.Drawing.Size(80, 24);
            this.btn_Tim.TabIndex = 3;
            this.btn_Tim.Text = "Tìm";
            this.btn_Tim.UseVisualStyleBackColor = true;
            this.btn_Tim.Click += new System.EventHandler(this.btn_Tim_Click);
            // 
            // txb_TimKiemSach
            // 
            this.txb_TimKiemSach.Location = new System.Drawing.Point(130, 44);
            this.txb_TimKiemSach.Name = "txb_TimKiemSach";
            this.txb_TimKiemSach.Size = new System.Drawing.Size(379, 22);
            this.txb_TimKiemSach.TabIndex = 2;
            this.txb_TimKiemSach.TextChanged += new System.EventHandler(this.txb_TimKiemSach_TextChanged);
            // 
            // rbtn_TimKiemTenSach
            // 
            this.rbtn_TimKiemTenSach.AutoSize = true;
            this.rbtn_TimKiemTenSach.Location = new System.Drawing.Point(40, 80);
            this.rbtn_TimKiemTenSach.Name = "rbtn_TimKiemTenSach";
            this.rbtn_TimKiemTenSach.Size = new System.Drawing.Size(90, 21);
            this.rbtn_TimKiemTenSach.TabIndex = 1;
            this.rbtn_TimKiemTenSach.TabStop = true;
            this.rbtn_TimKiemTenSach.Text = "Tên Sách";
            this.rbtn_TimKiemTenSach.UseVisualStyleBackColor = true;
            // 
            // rbtn_TimKiemMaSach
            // 
            this.rbtn_TimKiemMaSach.AutoSize = true;
            this.rbtn_TimKiemMaSach.Location = new System.Drawing.Point(40, 44);
            this.rbtn_TimKiemMaSach.Name = "rbtn_TimKiemMaSach";
            this.rbtn_TimKiemMaSach.Size = new System.Drawing.Size(84, 21);
            this.rbtn_TimKiemMaSach.TabIndex = 0;
            this.rbtn_TimKiemMaSach.TabStop = true;
            this.rbtn_TimKiemMaSach.Text = "Mã Sách";
            this.rbtn_TimKiemMaSach.UseVisualStyleBackColor = true;
            // 
            // dgv_Sach
            // 
            this.dgv_Sach.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_Sach.Location = new System.Drawing.Point(79, 215);
            this.dgv_Sach.Name = "dgv_Sach";
            this.dgv_Sach.RowHeadersWidth = 51;
            this.dgv_Sach.RowTemplate.Height = 24;
            this.dgv_Sach.Size = new System.Drawing.Size(683, 253);
            this.dgv_Sach.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial Narrow", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(317, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(163, 29);
            this.label1.TabIndex = 2;
            this.label1.Text = "TÌM KIẾM SÁCH";
            // 
            // TimKiemSach
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 492);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgv_Sach);
            this.Controls.Add(this.panel1);
            this.Name = "TimKiemSach";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "TimKiemSach";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Sach)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.RadioButton rbtn_TimKiemTenSach;
        private System.Windows.Forms.RadioButton rbtn_TimKiemMaSach;
        private System.Windows.Forms.Button btn_Tim;
        private System.Windows.Forms.TextBox txb_TimKiemSach;
        private System.Windows.Forms.Button btn_Thoat;
        private System.Windows.Forms.DataGridView dgv_Sach;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
    }
}