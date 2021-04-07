package com.finalDesign.controller;


import com.finalDesign.pojo.Books;
import com.finalDesign.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @RequestMapping("/allBook")
    public String list(Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "allBook";
    }

    @RequestMapping("/toAddBook")
    public String toAddPapper() {
        return "addBook";

    }
    @RequestMapping("/addBook")
    public String addbook(Books books){
        System.out.println("addbook"+books);
        bookService.addBook(books);
        return "redirect:/book/allBook";//重定向
    }

    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(int id,Model model){
       Books books=bookService.queryBooksById(id);
        model.addAttribute("QBook",books);
    return "updateBook";
    }
@RequestMapping("/updateBook")
    public String updateBook(Books books){
        System.out.println("updatebooks=>"+books);
        int i=bookService.updateBook(books);
        if(i>0){
            System.out.println(books);
        }
    return "redirect:/book/allBook";
    }

    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        bookService.deleteBookById(id);

        return "redirect:/book/allBook";
    }
    @RequestMapping("/queryBook")
    public String queryBook(String queryBookName,Model model){
        Books books = bookService.queryBookByName(queryBookName);
        List<Books> list=new ArrayList<Books>();
        list.add(books);
        if(books==null){
            list=bookService.queryAllBook();
            model.addAttribute("error","未查到");
        }
        model.addAttribute("list",list);
        return "allBook";
    }



}
