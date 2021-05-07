
namespace AppQuanLyThuVien
{
    partial class TimKiemDocGia
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
            this.txb_TimKiemDocGia = new System.Windows.Forms.TextBox();
            this.rbtn_TimKiemTenDocGia = new System.Windows.Forms.RadioButton();
            this.rbtn_TimKiemMaDocGia = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.dgv_DocGia = new System.Windows.Forms.DataGridView();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_DocGia)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.btn_Thoat);
            this.panel1.Controls.Add(this.btn_Tim);
            this.panel1.Controls.Add(this.txb_TimKiemDocGia);
            this.panel1.Controls.Add(this.rbtn_TimKiemTenDocGia);
            this.panel1.Controls.Add(this.rbtn_TimKiemMaDocGia);
            this.panel1.Location = new System.Drawing.Point(62, 92);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(683, 127);
            this.panel1.TabIndex = 1;
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
            // txb_TimKiemDocGia
            // 
            this.txb_TimKiemDocGia.Location = new System.Drawing.Point(149, 42);
            this.txb_TimKiemDocGia.Name = "txb_TimKiemDocGia";
            this.txb_TimKiemDocGia.Size = new System.Drawing.Size(379, 22);
            this.txb_TimKiemDocGia.TabIndex = 2;
            // 
            // rbtn_TimKiemTenDocGia
            // 
            this.rbtn_TimKiemTenDocGia.AutoSize = true;
            this.rbtn_TimKiemTenDocGia.Location = new System.Drawing.Point(40, 71);
            this.rbtn_TimKiemTenDocGia.Name = "rbtn_TimKiemTenDocGia";
            this.rbtn_TimKiemTenDocGia.Size = new System.Drawing.Size(109, 21);
            this.rbtn_TimKiemTenDocGia.TabIndex = 1;
            this.rbtn_TimKiemTenDocGia.TabStop = true;
            this.rbtn_TimKiemTenDocGia.Text = "Tên Độc Giả";
            this.rbtn_TimKiemTenDocGia.UseVisualStyleBackColor = true;
            // 
            // rbtn_TimKiemMaDocGia
            // 
            this.rbtn_TimKiemMaDocGia.AutoSize = true;
            this.rbtn_TimKiemMaDocGia.Location = new System.Drawing.Point(40, 44);
            this.rbtn_TimKiemMaDocGia.Name = "rbtn_TimKiemMaDocGia";
            this.rbtn_TimKiemMaDocGia.Size = new System.Drawing.Size(103, 21);
            this.rbtn_TimKiemMaDocGia.TabIndex = 0;
            this.rbtn_TimKiemMaDocGia.TabStop = true;
            this.rbtn_TimKiemMaDocGia.Text = "Mã Độc Giả";
            this.rbtn_TimKiemMaDocGia.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(328, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 17);
            this.label1.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Arial Narrow", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(280, 42);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(197, 29);
            this.label3.TabIndex = 3;
            this.label3.Text = "TÌM KIẾM ĐỘC GIẢ";
            // 
            // dgv_DocGia
            // 
            this.dgv_DocGia.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_DocGia.Location = new System.Drawing.Point(62, 242);
            this.dgv_DocGia.Name = "dgv_DocGia";
            this.dgv_DocGia.RowHeadersWidth = 51;
            this.dgv_DocGia.RowTemplate.Height = 24;
            this.dgv_DocGia.Size = new System.Drawing.Size(683, 228);
            this.dgv_DocGia.TabIndex = 4;
            this.dgv_DocGia.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // TimKiemDocGia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 482);
            this.Controls.Add(this.dgv_DocGia);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel1);
            this.Name = "TimKiemDocGia";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "TimKiemDocGia";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_DocGia)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_Thoat;
        private System.Windows.Forms.Button btn_Tim;
        private System.Windows.Forms.TextBox txb_TimKiemDocGia;
        private System.Windows.Forms.RadioButton rbtn_TimKiemTenDocGia;
        private System.Windows.Forms.RadioButton rbtn_TimKiemMaDocGia;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView dgv_DocGia;
    }
}