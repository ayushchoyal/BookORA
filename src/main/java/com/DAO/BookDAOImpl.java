package com.DAO;

import com.entity.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {
	private Connection conn;
	public BookDAOImpl(Connection conn) {
		this.conn=conn;
	}
	
	public boolean addBooks(BookDtls b) {
		boolean f = false;
		
		try {
			String sql = "insert into book_details(bookname,author,price,category,bookStatus,photo) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getPrice());
			ps.setString(4,b.getBookCategory());
			ps.setString(5,b.getBookStatus());
			ps.setString(6,b.getPhotoName());
			
			int i= ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<BookDtls> getAllBooks(){
		List<BookDtls>list = new ArrayList<>();
		BookDtls b= null;
		try {
			String sql= "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				    b = new BookDtls();
				    b.setBookId(rs.getInt("book_id")); 
				    b.setBookName(rs.getString("bookname"));
				    b.setAuthor(rs.getString("author"));
				    b.setPrice(rs.getString("price"));
				    b.setBookCategory(rs.getString("category"));
				    b.setBookStatus(rs.getString("bookStatus"));
				    b.setPhotoName(rs.getString("photo"));
	                
	                list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	 public BookDtls getBookById(int id) {
	        BookDtls b = null;
	        try {

	            String sql = "select * from book_details where book_id=?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, id);

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                b = new BookDtls();
	                b.setBookId(rs.getInt("book_id")); // <-- Use actual DB column name
	                b.setBookName(rs.getString("bookname"));
	                b.setAuthor(rs.getString("author"));
	                b.setPrice(rs.getString("price"));
	                b.setBookCategory(rs.getString("category"));
	                b.setBookStatus(rs.getString("bookStatus"));
	                b.setPhotoName(rs.getString("photo"));

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return b;
	    }

	    public boolean updateEditBooks(BookDtls b) {
	        boolean f = false;
	        try {
	            String sql = "update book_details set bookname=?, author=?, price=?, bookStatus=? where book_id=?";
	            PreparedStatement ps = conn.prepareStatement(sql);

	            ps.setString(1, b.getBookName());
	            ps.setString(2, b.getAuthor());
	            ps.setString(3, b.getPrice());
	            ps.setString(4, b.getBookStatus());
	            ps.setInt(5, b.getBookId()); // <-- The issue is here, it should be ps.setInt(5, b.getBookId());

	            int i = ps.executeUpdate();
	            if (i == 1) {
	                f = true;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return f;
	    }

	    public boolean deleteBooks(int id) {
	        boolean f = false;
	        try {
	            String sql = "delete from book_details where book_id=?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, id);
	            int i = ps.executeUpdate();
	            if (i == 1) {
	                f = true;

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return f;
	    }

	
	public List<BookDtls> getNewBook(){
		List<BookDtls> list = new ArrayList<>();
		BookDtls b =null;
		try {
			String sql="select * from book_details where category=? and bookStatus=? order by book_id DESC";
			 PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, "New");
	            ps.setString(2, "Active");
	            ResultSet rs = ps.executeQuery();
			
			int i=1;
			while(rs.next() && i<=4) {
				 b = new BookDtls();
				 b.setBookId(rs.getInt("book_id")); // <-- Use actual DB column name
				 b.setBookName(rs.getString("bookname"));
				 b.setAuthor(rs.getString("author"));
				 b.setPrice(rs.getString("price"));
				 b.setBookCategory(rs.getString("category"));
				 b.setBookStatus(rs.getString("bookStatus"));
				 b.setPhotoName(rs.getString("photo"));
	                
	                list.add(b);
	                i++;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls>getOldBook(){
		List<BookDtls>list=new ArrayList<>();
		BookDtls b=null;
		try {
			String sql="select * from book_details where category=? and bookStatus=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			int i=1;
			while(rs.next() && i<=4) {
				 b = new BookDtls();
				 b.setBookId(rs.getInt("book_id")); // <-- Use actual DB column name
				 b.setBookName(rs.getString("bookname"));
				 b.setAuthor(rs.getString("author"));
				 b.setPrice(rs.getString("price"));
				 b.setBookCategory(rs.getString("category"));
				 b.setBookStatus(rs.getString("bookStatus"));
				 b.setPhotoName(rs.getString("photo"));
	                
	                list.add(b);
	                i++;
			}
			}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBooks() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			String sql="select * from book_details where  bookStatus=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			int i=1;
			while(rs.next() && i<=4){
				b = new BookDtls();
				 b.setBookId(rs.getInt("book_id")); // <-- Use actual DB column name
				 b.setBookName(rs.getString("bookname"));
				 b.setAuthor(rs.getString("author"));
				 b.setPrice(rs.getString("price"));
				 b.setBookCategory(rs.getString("category"));
				 b.setBookStatus(rs.getString("bookStatus"));
				 b.setPhotoName(rs.getString("photo"));
	                
	                list.add(b);
	                i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	 public List<BookDtls> getAllRecentBook() {
		 List<BookDtls> list = new ArrayList<>();
			BookDtls b = null;
			try {
				String sql="select * from book_details where  bookStatus=? order by book_id DESC";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "Active");
				
				ResultSet rs = ps.executeQuery();
				
				
				while(rs.next() ){
					b = new BookDtls();
					 b.setBookId(rs.getInt("book_id")); // <-- Use actual DB column name
					 b.setBookName(rs.getString("bookname"));
					 b.setAuthor(rs.getString("author"));
					 b.setPrice(rs.getString("price"));
					 b.setBookCategory(rs.getString("category"));
					 b.setBookStatus(rs.getString("bookStatus"));
					 b.setPhotoName(rs.getString("photo"));
		                
		                list.add(b);
		                
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;	 
			
	 }
	 
	 
	 
	 public List<BookDtls> getAllNewBook() {
			List<BookDtls> list = new ArrayList<>();
			BookDtls b =null;
			try {
				String sql="select * from book_details where category=? and bookStatus=? order by book_id DESC";
				 PreparedStatement ps = conn.prepareStatement(sql);
		            ps.setString(1, "New");
		            ps.setString(2, "Active");
		            ResultSet rs = ps.executeQuery();
				
			
				while(rs.next() ) {
					 b = new BookDtls();
					 b.setBookId(rs.getInt("book_id")); // <-- Use actual DB column name
					 b.setBookName(rs.getString("bookname"));
					 b.setAuthor(rs.getString("author"));
					 b.setPrice(rs.getString("price"));
					 b.setBookCategory(rs.getString("category"));
					 b.setBookStatus(rs.getString("bookStatus"));
					 b.setPhotoName(rs.getString("photo"));
		                
		                list.add(b);
		                
				}
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
	    }

	 @Override
	 public List<BookDtls> getAllOldBook() {
		 List<BookDtls>list=new ArrayList<>();
			BookDtls b=null;
			try {
				String sql="select * from book_details where category=? and bookStatus=? order by book_id DESC";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "Old");
				ps.setString(2, "Active");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next() ) {
					 b = new BookDtls();
					 b.setBookId(rs.getInt("book_id")); // <-- Use actual DB column name
					 b.setBookName(rs.getString("bookname"));
					 b.setAuthor(rs.getString("author"));
					 b.setPrice(rs.getString("price"));
					 b.setBookCategory(rs.getString("category"));
					 b.setBookStatus(rs.getString("bookStatus"));
					 b.setPhotoName(rs.getString("photo"));
		                
		                list.add(b);
		                
				}
				}catch(Exception e){
				e.printStackTrace();
			}
			return list;

	 }

	 @Override
	 public List<BookDtls> getBookBySearch(String ch) {
		    List<BookDtls> list = new ArrayList<>();
		    BookDtls b = null;

		    try {
		        String sql = "SELECT * FROM book_details WHERE (bookname LIKE ? OR author LIKE ? OR category LIKE ?) AND bookStatus=?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, "%" + ch + "%");
		        ps.setString(2, "%" + ch + "%");
		        ps.setString(3, "%" + ch + "%");
		        ps.setString(4, "Active");

		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            b = new BookDtls();
		            b.setBookId(rs.getInt(1));
		            b.setBookName(rs.getString(2));
		            b.setAuthor(rs.getString(3));
		            b.setPrice(rs.getString(4));
		            b.setBookCategory(rs.getString(5));
		        
		            b.setPhotoName(rs.getString(7));
		           

		            list.add(b);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return list;
		}

	 
	 
	
}







