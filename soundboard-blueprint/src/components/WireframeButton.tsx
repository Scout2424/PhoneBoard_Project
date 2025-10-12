import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";

interface WireframeButtonProps {
  index: number;
}

export const WireframeButton = ({ index }: WireframeButtonProps) => {
  return (
    <Button
      variant="outline"
      className={cn(
        "h-28 w-full rounded-lg border-2 border-dashed border-border",
        "bg-card hover:bg-secondary/50 transition-colors",
        "flex flex-col items-center justify-center gap-2"
      )}
    >
      <div className="w-12 h-12 rounded-full border-2 border-muted-foreground/30 bg-muted/30" />
      <span className="text-sm font-medium text-muted-foreground">
        Button {index + 1}
      </span>
    </Button>
  );
};
