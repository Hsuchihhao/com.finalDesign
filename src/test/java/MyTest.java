import com.finalDesign.pojo.Books;
import com.finalDesign.service.BookService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {

    @Test
    public  void test(){
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");

        BookService bookServiceImpl = (BookService) context.getBean("BookServiceImpl");
       Books books =bookServiceImpl.queryBooksById(1);
            System.out.println(books);


    }
}
