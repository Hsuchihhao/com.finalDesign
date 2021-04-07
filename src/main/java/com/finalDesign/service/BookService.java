package com.finalDesign.service;

import com.finalDesign.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {

    int addBook(Books books);

    int deleteBookById(@Param("bookId") int id);

    int updateBook(Books books);

    Books queryBooksById(int id);

    List<Books> queryAllBook();

    Books queryBookByName(@Param("bookName") String bookName);
}
