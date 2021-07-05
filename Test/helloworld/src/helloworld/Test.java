package helloworld;

public class Test {//버블(교환정렬)
public static void main(String[]args) {
	int tem;
	int[] a={1,5,3,2,7,9};

	for(int i=0;i<a.length;i++) {
		
		for(int j=0;j<i-1;j++) {
			
			if(a[j]>a[j+1]) {
				tem=a[j];
				a[j]=a[j+1];
				a[j+1]=tem;
			}
		}
	}
	for(int z=0;z<a.length;z++) {
		System.out.print(a[z]+" ");
	}
}
}
