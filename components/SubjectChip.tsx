import { hueOf } from "@/lib/ui";
export default function SubjectChip({ name }: { name: string }) {
  return <span className="chip" style={{ "--h": hueOf(name) } as React.CSSProperties}><i className="dot" />{name}</span>;
}
