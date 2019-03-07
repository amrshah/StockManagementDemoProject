using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace SMDPDataAccess
{
    class SqlDBHelper
    {
        //const string CONNECTION_STRING = @"Data Source=HPALI\MSSQLSERVER2016;Initial Catalog=AEHInventoryDB;Integrated Security=True";
        const string CONNECTION_STRING = "PLEASE_SET_YOUR_CONNECTION_STRING_HERE_OR_IN_A_CONIG_FILE";

        /**
         * Use for executing slect only procedures with or without parameters
         * */
        internal static DataTable ExecuteSelectCommand(string CommandName, CommandType cmdType, SqlParameter[] param=null)
        {
            DataTable table = null;
            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    if(param != null)
                        cmd.Parameters.AddRange(param);
                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            table = new DataTable();
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }                   
                }
            }

            return table;
        }

        /**
         * For Parameterized Select.
         * I am deciding to drop it in next version as we can now use "ExecuteSelectCommand" with or without parameters
         * */
        internal static DataTable ExecuteParamerizedSelectCommandDeprected(string CommandName, CommandType cmdType, SqlParameter[] param)
        {
            DataTable table = new DataTable();

            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(param);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }                    
                }
            }

            return table;
        }

        // This function will be used to execute CUD(CRUD) operation of parameterized commands
        internal static bool ExecuteNonQuery(string CommandName, CommandType cmdType, SqlParameter[] pars)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(pars);                    

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        result = cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        throw;
                    }                   
                }
            }

            return (result > 0);        
        }        
    }
}
