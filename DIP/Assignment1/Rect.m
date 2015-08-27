function k = Rect(x1,y1,x2,y2,Img1)
        for i1=x1:x2
            Img1(i1,y2,1)=255;
            Img1(i1,y2,2)=0;
            Img1(i1,y2,3)=0;
        end
        
       
        for i1=x1:x2
            Img1(i1,y1,1)=255;
            Img1(i1,y1,2)=0;
            Img1(i1,y1,3)=0;
        end
        for i1=y1:y2
            Img1(x1,i1,1)=255;
            Img1(x1,i1,2)=0;
            Img1(x1,i1,3)=0;
        end
         for i1=y1:y2
            Img1(x2,i1,1)=255;
            Img1(x2,i1,2)=0;
            Img1(x2,i1,3)=0;
         end
     
        
        k=Img1;
        
end

