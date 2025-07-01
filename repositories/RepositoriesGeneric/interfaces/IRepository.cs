using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agroledger.repositories.RepositoriesGeneric.interfaces
{
    public interface IRepository<T> where T : class
    {
        T Get(Func<T, bool> predicate);
        IEnumerable<T> GetAll();
        void Add(T entity);
        void Update(T entity);
        void Delete(T entity);

    }
}