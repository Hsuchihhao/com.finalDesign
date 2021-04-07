package com.finalDesign.service;

import com.finalDesign.dao.BookMapper;
import com.finalDesign.pojo.Books;

import java.util.List;

public class BookServiceImpl implements  BookService{
    private BookMapper bookMapper;


    public void setBookMapper(BookMapper bookMapper) {

        this.bookMapper = bookMapper;
    }



    @Override
    public int addBook(Books books) {

        return bookMapper.addBook(books);
    }

    @Override
    public int deleteBookById(int id) {

        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {

        return bookMapper.updateBook(books);
    }

    @Override
    public Books queryBooksById(int id) {

        return bookMapper.queryBooksById(id);
    }

    @Override
    public List<Books> queryAllBook() {

        return bookMapper.queryAllBook();
    }

    @Override
    public Books queryBookByName(String bookName) {

        return bookMapper.queryBookByName(bookName);
    }
}
