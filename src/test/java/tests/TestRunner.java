package tests;




//This code commented is with junit 4

//import org.junit.runner.RunWith;
//
//import com.intuit.karate.junit4.Karate;
//@RunWith(Karate.class)
//public class TestRunner {
//
//}
import com.intuit.karate.junit5.Karate;

class SampleTest {

    @Karate.Test
    Karate testSample() {
        return Karate.run("sample").relativeTo(getClass());
    }
    @Karate.Test
    Karate testTags() {
        return Karate.run("sample").tags("@second").relativeTo(getClass());
    }
    
    
    }