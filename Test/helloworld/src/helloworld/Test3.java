package helloworld;

public class Test3 {//삽입정렬
public static void main(String[]args) {
	int[] a={1,5,3,2,7,9};

	for(int i=1;i<a.length;i++) {
		int tem=a[i];
			int j=i-1;
			while((a[j]>tem)&&(a[j]>=0)) {//for문써도 되는데 불필요한 자원낭비 예방
				a[j+1]=a[j];
				j--;
			}
			a[j+1]=tem;
	}
	for(int z=0;z<a.length;z++) {
		System.out.print(a[z]+" ");
	}
}
}
