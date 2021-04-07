package com.finalDesign.dao;

import com.finalDesign.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BookMapper {
    int addBook(Books books);

    int deleteBookById(@Param("bookId") int id);

    int updateBook(Books books);

    Books queryBooksById(int id);

    List<Books> queryAllBook();

    Books queryBookByName(@Param("bookName") String bookName);


}
