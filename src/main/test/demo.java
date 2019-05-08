import com.bcsd.dao.MeetLimitDao;
import com.bcsd.entity.MeetLimit;
import com.bcsd.entity.MeetLimitUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/29
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-application.xml")
public class demo {
    @Autowired
    private MeetLimitDao meetLimitDao;
    @Test
    public void tt(){
       Integer a=1;
        List<MeetLimitUser> byUser = meetLimitDao.findByUser(1);
        System.out.println(byUser);

    }

    @Test
    public void demo(){
        List<MeetLimit> bylimit = meetLimitDao.findBylimit(1);
        System.out.println(bylimit);

    }


}
