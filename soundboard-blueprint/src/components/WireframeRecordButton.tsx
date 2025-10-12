import { Button } from "@/components/ui/button";
import { Circle } from "lucide-react";

export const WireframeRecordButton = () => {
  return (
    <div className="flex flex-col items-center gap-3">
      <Button
        size="lg"
        className="h-32 w-32 rounded-full bg-accent hover:bg-accent/90 transition-all shadow-lg"
      >
        <Circle className="h-12 w-12 text-accent-foreground fill-accent-foreground" />
      </Button>
      
      <div className="text-center">
        <div className="text-sm font-medium text-muted-foreground">
          Record Button
        </div>
        <div className="text-xs text-muted-foreground/70">
          (Max 10s)
        </div>
      </div>
    </div>
  );
};
