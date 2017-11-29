import org.junit.Test;

import java.math.BigDecimal;

/**
 * Created by zhouning on 2017/11/29.
 * desc:
 */
public class Test01 {


    @Test
    public  void test(){
        BigDecimal total = BigDecimal.valueOf(3);
        BigDecimal active = BigDecimal.valueOf(1);
        System.out.println(active.divide(total,4,BigDecimal.ROUND_HALF_UP));
    }
}
