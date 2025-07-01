using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using Dapper.Contrib.Extensions;


namespace Agroledger.repositories.RepositoriesGeneric
{
    public class GenericRepository<T> where T : class
    {
        protected readonly string connectionString;

        public GenericRepository()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        }

        public IEnumerable<T> GetAll()
        {
            using (IDbConnection db = new MySqlConnection(connectionString))
            {
                return db.GetAll<T>();
            }
        }



        public T Get(Func<T, bool> predicate)
        {
            return GetAll().FirstOrDefault(predicate);
        }

        public void Add(T entity)
        {
            using (IDbConnection db = new MySqlConnection(connectionString))
            {
                db.Insert(entity);
            }
        }

        public void Update(T entity)
        {
            using (IDbConnection db = new MySqlConnection(connectionString))
            {
                db.Update(entity);
            }
        }

        public void Delete(T entity)
        {
            using (IDbConnection db = new MySqlConnection(connectionString))
            {
                db.Delete(entity);
            }
        }
    }
}