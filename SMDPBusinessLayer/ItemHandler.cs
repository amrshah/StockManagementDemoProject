using SMDPDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SMDPBusinessLayer
{
    public class ItemHandler
    {
        ItemsDBAccess dbAccess;
        public ItemHandler()
        {
            dbAccess = new ItemsDBAccess();
        }
        public IList<SMDPDataAccess.Item> GetAll()
        {
            IList<Item> items = null;
            items = dbAccess.GetItemsList();

            if (items == null)
                items = new List<Item>();

            return items;            
        }
        public bool AddNewItem(Item item)
        {
            return dbAccess.AddNew(item);
        }

        public Item GetById(int id)
        {
            return dbAccess.GetById(id);
        }

        public bool UpdateItem(Item item)
        {
            return dbAccess.Update(item);
        }

        public bool DeleteItem(int id)
        {
            return dbAccess.DeleteItem(id);
        }
    }
}
