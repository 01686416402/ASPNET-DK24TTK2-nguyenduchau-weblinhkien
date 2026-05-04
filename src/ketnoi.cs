using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public class ketnoi
{
    string connStr;

    public ketnoi()
    {
        // lấy từ Web.config (chuẩn nhất)
        connStr = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    }

    // ===== SELECT =====
    public DataTable getData(string sql)
    {
        DataTable dt = new DataTable();

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlDataAdapter da = new SqlDataAdapter(sql, conn))
            {
                da.Fill(dt);
            }
        }

        return dt;
    }

    // ===== INSERT / UPDATE / DELETE =====
    public void exec(string sql)
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();

            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.ExecuteNonQuery();
            }

            conn.Close();
        }
    }
}