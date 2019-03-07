using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace SMDPDataAccess
{
    public class ItemsDBAccess
    {
        public  IList<Item> GetItemsList()
        {
            List<Item> itemsList = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("spGetItemsList", CommandType.StoredProcedure))
            {
                //check if any record exist or not
                if (table.Rows.Count > 0)
                {
                    //Lets go ahead and create the list of employees
                    itemsList = new List<Item>();

                    //Now lets populate the employee details into the list of employees
                    foreach (DataRow row in table.Rows)
                    {
                        Item item = new Item();
                        item.Id = Convert.ToInt32(row["Id"]);
                        item.Name = row["ItemName"].ToString();
                        item.Description = row["Description"].ToString();
                        
                        itemsList.Add(item);
                    }
                }
            }
            return itemsList;
        }

        public Item GetById(int id)
        {
            Item item = null;

            SqlParameter[] parameters = new SqlParameter[] { new SqlParameter("@ItemId", id) };

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("spGetItemById", CommandType.StoredProcedure, parameters))
            {                
                if (table.Rows.Count == 1)
                {
                    item = new Item();

                    //Now lets populate the employee details into the list of employees
                    DataRow row = table.Rows[0];
                    item.Id = Convert.ToInt32(row["Id"]);
                    item.Name = row["ItemName"].ToString();
                    item.Description = row["Description"].ToString();
                    item.CreatedAt = DateTime.Parse(row["created_at"].ToString());
                    //item.UpdatedAt = DateTime.Parse(row["updated_at"].ToString());
                    //item.DeletedAt = DateTime.Parse(row["deleted_at"].ToString());                    
                }
            }
            return item;
        }

        public bool Update(Item item)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@ItemName", item.Name),
                new SqlParameter("@Description", item.Description),
                new SqlParameter("@ItemId", item.Id),
                new SqlParameter("@UpdatedAt", DateTime.Now)
            };

            return SqlDBHelper.ExecuteNonQuery("spUpdateItem", CommandType.StoredProcedure, parameters);

        }

        public bool AddNew(Item item)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@ItemName", item.Name),
                new SqlParameter("@Description", item.Description),
                new SqlParameter("@CreatedAt", DateTime.Now)
            };

            return SqlDBHelper.ExecuteNonQuery("spAddNewItem", CommandType.StoredProcedure, parameters);
        }

        public bool DeleteItem(int itemId, bool softDelete=true)
        {            
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@ItemId", itemId),
                new SqlParameter("@DeletedAt", DateTime.Now),
                new SqlParameter("@SoftDelete", softDelete),
            };

            return SqlDBHelper.ExecuteNonQuery("spDeleteItem", CommandType.StoredProcedure, parameters);
        }
    }
}
