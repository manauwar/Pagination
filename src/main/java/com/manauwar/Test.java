
package com.manauwar;

public class Test {

	public static void main(String[] args) {

		int start = 1;
		int end = 1;
		int recordsPerPage = 5;
		int count = 54;
		for (int i = 1; i <= count; i = i + 1) {
			// System.out.println(i);

			if ((i % recordsPerPage) == 0) {

				start = i - (recordsPerPage -1);
				end = i;
				for (int j = start; j <= end; j++)
					System.out.print(j + " ");
				System.out.println();
			}
		}
		
		if (count > end) {
			start = end + 1;
			end = count;
			for (int j = start; j <= end; j++)
				System.out.print(j + " ");
		}
	}

}
