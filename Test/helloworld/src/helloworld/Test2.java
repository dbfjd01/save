package helloworld;

public class Test2 {//선택정렬
public static void main(String[]args) {
	int tem,min;
	int[] a={1,5,3,2,7,9};

	for(int i=0;i<a.length;i++) {
		min=i;
		for(int j=i+1;j<a.length;j++) {
			
			if(a[j]<a[min]) {
				min=j;
			}
		}
		if(a[min]!=a[i]) {
			tem=a[min];
			a[min]=a[i];
			a[i]=tem;
		}
	}
	for(int z=0;z<a.length;z++) {
		System.out.print(a[z]+" ");
	}
}
}
