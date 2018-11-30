import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class BranchTest {

	/******************************************************************
	 *
	 * Test makes10
	 *
	 *****************************************************************/

	@Test
	public void makes10_aIs10() {
		run("makes10", 10, 3);
		Assert.assertEquals(1, get(v0));
	}

	@Test
	public void makes10_bIs10() {
		run("makes10", 3, 10);
		Assert.assertEquals(1, get(v0));
	}

	@Test
	public void makes10_addTo10_1() {
		run("makes10", 7, 3);
		Assert.assertEquals(1, get(v0));
	}
	
	@Test
	public void makes10_addTo10_2() {
		run("makes10", 3, 7);
		Assert.assertEquals(1, get(v0));
	}
	
	@Test
	public void makes10_neither() {
		run("makes10", 3, 6);
		Assert.assertEquals(0, get(v0));
	}

	// Write more tests!

	/******************************************************************
	 *
	 * Test intMax
	 *
	 *****************************************************************/

	@Test
	public void intMax_ascending() {
		run("intMax", 5, 6, 7);
		Assert.assertEquals(7, get(v0));
	}

	@Test
	public void intMax_descending() {
		run("intMax", 7, 6, 5);
		Assert.assertEquals(7, get(v0));
	}
	
	@Test
	public void intMax_equal() {
		run("intMax", 1, 1, 1);
		Assert.assertEquals(1, get(v0));
	}
	
	@Test
	public void intMax_middle() {
		run("intMax", 1, 2, 1);
		Assert.assertEquals(2, get(v0));
	}

	// Write more tests!

	/******************************************************************
	 *
	 * Test close10
	 *
	 *****************************************************************/

	@Test
	public void close10_aClosest() {
		run("close10", 8, 13);
		Assert.assertEquals(8, get(v0));
	}
	
	@Test
	public void close10_bClosest() {
		run("close10", 13, 8);
		Assert.assertEquals(8, get(v0));
	}
	
	@Test
	public void close10_equal() {
		run("close10", 11, 9);
		Assert.assertEquals(0, get(v0));
	}
	
	@Test
	public void close10_b10() {
		run("close10", 11, 10);
		Assert.assertEquals(10, get(v0));
	}
	
	@Test
	public void close10_a10() {
		run("close10", 10, 9);
		Assert.assertEquals(10, get(v0));
	}

	@Test
	public void close10_bNegative() {
		run("close10", 10, -2);
		Assert.assertEquals(10, get(v0));
	}

	// Write more tests!

	/******************************************************************
	 *
	 * Test dateFashion
	 *
	 *****************************************************************/

	@Test
	public void dateFashion_youOk_dateStylish() {
		run("dateFashion", 5, 10);
		Assert.assertEquals(2, get(v0));
	}
	
	@Test
	public void dateFashion_youOk_youStylish() {
		run("dateFashion", 10, 5);
		Assert.assertEquals(2, get(v0));
	}
	
	@Test
	public void dateFashion_notOk_youBad() {
		run("dateFashion", 1, 5);
		Assert.assertEquals(0, get(v0));
	}
	
	@Test
	public void dateFashion_notOk_dateBad() {
		run("dateFashion", 5, 1);
		Assert.assertEquals(0, get(v0));
	}
	
	@Test
	public void dateFashion_maybeOk_1() {
		run("dateFashion", 3, 7);
		Assert.assertEquals(1, get(v0));
	}
	
	@Test
	public void dateFashion_maybeOk_2() {
		run("dateFashion", 5, 4);
		Assert.assertEquals(1, get(v0));
	}

	// Write more tests!

} // end class
