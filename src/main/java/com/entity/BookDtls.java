package com.entity;

public class BookDtls {

	private int bookId;
	private String bookName;
	private String author;
	private String price;
	private String bookCategory;
	private String bookStatus;
	private String photoName;
	
	 public BookDtls() {
	        super();

	    }
	 
	 public BookDtls(String bookName, String author, String price, String bookCategory, String bookStatus,
				String photoName) {
			
			this.bookName = bookName;
			this.author = author;
			this.price = price;
			this.bookCategory = bookCategory;
			this.bookStatus = bookStatus;
			this.photoName = photoName;
			
		}
	 
	 public int getBookId() {
	        return bookId;
	    }

	    public void setBookId(int bookId) {
	        this.bookId = bookId;
	    }

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBookCategory() {
		return bookCategory;
	}

	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}

	public String getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}



	@Override
	public String toString() {
		return "BookDtls [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ", bookStatus=" + bookStatus + ", photoName=" + photoName
				 ;
	}

	
	
	
}
