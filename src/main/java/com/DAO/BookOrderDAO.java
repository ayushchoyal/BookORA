package com.DAO;

import com.entity.BookOrder;
import java.util.List;




public interface BookOrderDAO {

	
	public boolean saveOrder(List<BookOrder> blist);
    
    public List<BookOrder> getBook(String email);
    
    public List<BookOrder> getAllOrder();
    
    public boolean orderDelete(String oid);
    
     
}
