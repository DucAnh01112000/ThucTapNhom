
namespace AppQuanLyThuVien
{
    partial class ThongKeDocGiaQuaHan
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
            this.dgv_ThongKeDocGiaQuaHan = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ThongKeDocGiaQuaHan)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgv_ThongKeDocGiaQuaHan
            // 
            this.dgv_ThongKeDocGiaQuaHan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_ThongKeDocGiaQuaHan.Location = new System.Drawing.Point(12, 143);
            this.dgv_ThongKeDocGiaQuaHan.Name = "dgv_ThongKeDocGiaQuaHan";
            this.dgv_ThongKeDocGiaQuaHan.RowHeadersWidth = 51;
            this.dgv_ThongKeDocGiaQuaHan.RowTemplate.Height = 24;
            this.dgv_ThongKeDocGiaQuaHan.Size = new System.Drawing.Size(776, 295);
            this.dgv_ThongKeDocGiaQuaHan.TabIndex = 1;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(776, 125);
            this.panel1.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(226, 44);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(312, 19);
            this.label1.TabIndex = 0;
            this.label1.Text = "THỐNG KÊ ĐỘC GIẢ MƯỢN QUÁ HẠN";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // ThongKeDocGiaQuaHan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dgv_ThongKeDocGiaQuaHan);
            this.Controls.Add(this.panel1);
            this.Name = "ThongKeDocGiaQuaHan";
            this.Text = "ThongKeDocGiaQuaHan";
            this.Load += new System.EventHandler(this.ThongKeDocGiaQuaHan_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ThongKeDocGiaQuaHan)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgv_ThongKeDocGiaQuaHan;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
    }
}