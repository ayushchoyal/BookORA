package com.DAO;

import java.util.List;
import com.entity.BookDtls;


public interface BookDAO {
		
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);

	public boolean updateEditBooks(BookDtls b);

	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	 public List<BookDtls> getOldBook();

	 public List<BookDtls> getRecentBooks();
	
	 public List<BookDtls> getAllRecentBook();
	 
	 public List<BookDtls> getAllNewBook();
	 
	 public List<BookDtls> getAllOldBook();
	 
	 public List<BookDtls> getBookBySearch(String ch);
}
