function k = Rect(x1,y1,x2,y2,Img1,val)

        for i1=x1:x2
            Img1(i1,y2,1)=val;

        end
        
       
        for i1=x1:x2
            Img1(i1,y1,1)=val;

        end
        for i1=y1:y2
            Img1(x1,i1,1)=val;

        end
         for i1=y1:y2
            Img1(x2,i1,1)=val;

         end
     
        
        k=Img1;
        
end

